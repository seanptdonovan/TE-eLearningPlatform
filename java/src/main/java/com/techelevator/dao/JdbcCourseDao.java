package com.techelevator.dao;

import com.techelevator.model.Course;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class JdbcCourseDao implements CourseDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCourseDao(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    @Override
    public Course createCourse(Course course) {
        String sql = "INSERT INTO course (course_name, course_description, difficulty) " +
                "VALUES (?, ?, ?) RETURNING course_id;";

        Integer newCourseId = jdbcTemplate.queryForObject(sql, Integer.class, course.getCourseName(), course.getCourseDescription(), course.getDifficulty());
        if (newCourseId == null) {
            System.out.println("Error: Course could not be created");
            return null;
        }
        else {
            Course newCourse = new Course(newCourseId);
            System.out.println("New Course created");
            return newCourse;
        }
    }

    @Override
    public Course getCourseByCourseId(int courseId) {
        Course course = new Course();

        String sql = "SELECT * from COURSE WHERE course_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, courseId);
        while (results.next()) {
            course = mapRowToCourse(results);

        }
        return course;
    }

    @Override
    public Course getCourseByName(String courseName) {
        Course course = new Course();

        String sql = "SELECT * from COURSE WHERE course_name = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, courseName);
        while (results.next()) {
            course = mapRowToCourse(results);

        }
        return course;
    }

    @Override
    public List<Course> listCourses(){
        List<Course> courses = new ArrayList<>();
        String sql = "select course_id, course_name, course_description, difficulty, displayed_progress from course";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Course course = mapRowToCourse(results);
            courses.add(course);
        }

        return courses;
    }

    @Override
    public List<Course> listCoursesByUserId(int userId){
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT course.course_id, course_name, course_description, difficulty, displayed_progress FROM course " +
                "JOIN users_course ON users_course.course_id = course.course_id " +
                "JOIN users ON users.user_id = users_course.user_id " +
                "WHERE users.user_id =?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql,userId);
        while (results.next()) {
            Course course = mapRowToCourse(results);
            courses.add(course);
        }

        return courses;
    }

    @Override
    public List<Course> listCoursesByUsername(String username){
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT course.course_id, course_name, course_description, difficulty, displayed_progress FROM course " +
                "JOIN users_course ON users_course.course_id = course.course_id " +
                "JOIN users ON users.user_id = users_course.user_id " +
                "WHERE users.username =?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, username);
        while (results.next()) {
            Course course = mapRowToCourse(results);
            courses.add(course);
        }

        return courses;
    }

    @Override
    public void editCourse(Course course) {

        String sql = "UPDATE course SET course_name = ?, course_description = ?, difficulty = ? WHERE course_id = ?;";
        jdbcTemplate.update(sql, course.getCourseName(),course.getCourseDescription(),course.getDifficulty(), course.getCourseId());

    }

    @Override
    public void deleteCourse(int courseId) {
        String sql1 = "DELETE FROM users_course WHERE course_id =?";
                jdbcTemplate.update(sql1, courseId);

        String sql2 = "DELETE FROM course WHERE course_id =?;";
       int numberOfCoursesDeleted = jdbcTemplate.update(sql2, courseId);

    }

    @Override
    public Map<Integer, Double> mapCourseProgress(String username) {
        JdbcUserDao userDao = new JdbcUserDao(this.jdbcTemplate);
        int userId = userDao.findIdByUsername(username);

        List<Course> userCourseList = this.listCoursesByUserId(userId);
        Map<Integer, Double> courseProgressMap = new HashMap<>();

        for (Course course : userCourseList) {

            course.setDisplayedProgress(userDao.checkCourseCompletion(course.getCourseId(), userId));

            System.out.println("COURSE_ID:");
            System.out.println(course.getCourseId());
            System.out.println("COURSE_PROGRESS:");
            System.out.println();
            courseProgressMap.put(course.getCourseId(), course.getDisplayedProgress());
        }

        return courseProgressMap;
    }



    private Course mapRowToCourse(SqlRowSet result) {
        Course course = new Course();
        course.setCourseId(result.getInt("course_id"));
        course.setCourseName(result.getString("course_name"));
        course.setCourseDescription(result.getString("course_description"));
        course.setDifficulty(result.getString("difficulty"));
        course.setDisplayedProgress(result.getDouble("displayed_progress"));
        return course;

    }
}
