BEGIN TRANSACTION;

INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('admin','account','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('manager','account','manager','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_MANAGER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('user','account','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('John','Applebottom','japplebottom4','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('Samantha','Dentoula','sdentoula5','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('Amanda','Amanada','aamanda6','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('Philip','Hoffman','phoffman7','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('Santiago','Lopez','slopez8','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (first_name,last_name,username,password_hash,role) VALUES ('Mister','Danson','mdanson9','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');



INSERT INTO course (course_name,course_description, difficulty) VALUES ('Cyber Security','This course gives an in-depth view on best cyber security practices. The course introduces the concepts and understanding of the field of computer security and how it relates to other areas of information technology. Topics include security threats, hardening systems, securing networks, cryptography and organizational security policies.','Beginner');

INSERT INTO course (course_name,course_description, difficulty) VALUES ('Creating Safe Passwords','Ka ecabadic si ene sucuto neri; lehal tin netotu! Laya iciemu yo reyut remel ika upiep taqiese de! Irieli tefol sasiral. Abupage lig mihaboy orisenem asileli jeceri apo. Pahiza avidogis maso sinowos meliemo colanu supelu meg ticagag ici. Alil rakucir cim nasivieh nuwape ta neqade, tadil suwirie adicoriy fec. Ca nesi tu, asofi wize nuroh penitob nasi! Dibe pucat no lomasi sesov gahie nonago. Ludu yo inodimir','Intermediate');

COMMIT TRANSACTION;



BEGIN TRANSACTION;

INSERT INTO users_course (user_id,course_id) VALUES (2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1);
INSERT INTO users_course (user_id,course_id) VALUES (2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2);

INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (1,'Wi-Fi Safety','Practice safe web surfing wherever you are by checking for the “green lock” or padlock icon in your browser bar—this signifies a secure connection. When you find yourself out in the great “wild Wi-Fi West,” avoid free internet access with no encryption.');
INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (1,'Multi-Factor Authentication','Enable multi-factor authentication (MFA) to ensure that the only person who has access to your account is you. Use it for email, banking, social media, and any other service that requires logging in.');
INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (1,'App Security','Check your app permissions and use the “rule of least privilege” to delete what you don’t need or no longer use.. Learn to just say “no” to privilege requests that don’t make sense. Only download apps from trusted sources.');
INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (2,'Oversharing and Geotagging','What many people don’t realize is that these seemingly random details are all criminals need to know to target you, your loved ones, and even your physical belongings—online and in the real world. Avoid posting names, phone numbers, addresses, school and work locations, and other sensitive information');
INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (1,'Phishing','Cyber criminals will often offer a financial reward, threaten you if you don’t engage, or claim that someone is in need of help. Don’t fall for it! Keep your personal information as private as possible. If they have key details from your life—your job title, multiple email addresses, full name, and more that you may have published online somewhere—they can attempt a direct spear-phishing attack on you.');
INSERT INTO lesson (course_id,lesson_name,lesson_description) VALUES (2,'Passwords','It’s important to mix things up—get creative with easy-to-remember ways to customize your standard password for different sites. Having different passwords for various accounts can help prevent cyber criminals from gaining access to these accounts and protect you in the event of a breach.');

INSERT INTO lesson_users (lesson_id,user_id) VALUES (1,4),(3,4),(5,4),(2,4);
INSERT INTO lesson_users (lesson_id,user_id) VALUES (1,5),(2,5),(3,5),(4,5),(5,5),(6,5);
INSERT INTO lesson_users (lesson_id,user_id) VALUES (1,6),(6,6);
INSERT INTO lesson_users (lesson_id,user_id) VALUES (4,7),(5,7);
INSERT INTO lesson_users (lesson_id,user_id) VALUES (1,8),(3,8),(4,8),(5,8),(6,8);




COMMIT TRANSACTION;

BEGIN TRANSACTION;

INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (6, 1, 'Which of the following should you never use for a password?','All are true','Birthday','Same password from another account','The word password');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (6, 2, 'Why is it important to create different passwords for each of your online accounts?','With one password, hackers have access to multiple accounts','It’s not that important','Each site requires you to have a different password','To confuse yourself');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (6, 3, 'What should a good password include?','All are true','Numbers','More than 10 characters','Symbols');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (6, 4, 'Which of the following is the most secure password?','chEwbAccAp!ZZa3!','JohnSmith84!','123Abc','password');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (6, 5, 'What can you use to help keep track of all of your passwords?','Password Manager','Your brain','A friend','Just have one password for everything');

INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (1, 1, 'If you are using a home Wi-Fi network to access the Internet, you should make sure it is ___','secure','open to everyone','not working','open to hackers and cybercriminals');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (1, 2, 'When setting up your wireless security, consider which of the following?','All are true','Limit your signal strength','Use a strong password','Make sure the network utilizes WPA or WPA2');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (1, 3, 'Which of the following are places where you might have access to a public hotspot?','All of these are true','airport','coffee shops','hotels');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (1, 4, 'What should you keep in mind when you are using a public hotspot?','These all seem like good answers','Make sure you are on a legitimate network','Turn on your firewall','Do not conduct financial transactions while using a hotspot');
INSERT INTO lesson_question (lesson_id, question_number, question, solution, wrong_choice_1, wrong_choice_2, wrong_choice_3) VALUES (1, 5, 'Why should you turn your Wi-Fi Connection to Network settings to manual?','To stop it from connecting to an unknown network', 'Auto join is more FUN!','Auto-join never works anyways','None of these are true');

COMMIT TRANSACTION;
