CREATE DATABASE IF NOT EXISTS fmldb DEFAULT CHARACTER SET utf8 ;
USE fmldb ;

CREATE TABLE IF NOT EXISTS user (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  `password` INT NOT NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS course (
  `id` INT NOT NULL AUTO_INCREMENT,
  `courseTitle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS user_course (
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  INDEX `fk_user_course_user_idx` (`user_id` ASC),
  PRIMARY KEY (`user_id`, `course_id`),
  INDEX `fk_user_course_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_user_course_user`
  FOREIGN KEY (`user_id`)
  REFERENCES user (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_course_course1`
  FOREIGN KEY (`course_id`)
  REFERENCES course (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS quiz (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quizTitle` VARCHAR(45) NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_quiz_course1`
  FOREIGN KEY (`course_id`)
  REFERENCES course (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS question (
  `id` INT NOT NULL AUTO_INCREMENT,
  `questionTitle` VARCHAR(45) NOT NULL,
  `quiz_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_quiz1_idx` (`quiz_id` ASC),
  CONSTRAINT `fk_question_quiz1`
  FOREIGN KEY (`quiz_id`)
  REFERENCES quiz (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS choice (
  `id` INT NOT NULL AUTO_INCREMENT,
  `choiceTitle` VARCHAR(45) NOT NULL,
  `answer` BOOLEAN NOT NULL DEFAULT 0,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_choice_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_choice_question1`
  FOREIGN KEY (`question_id`)
  REFERENCES question (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

-- Default data indsættes

INSERT INTO user (firstName, lastName, userName, password, type)
VALUES ('Daniel','Gutfeld','gutfeld','1234', 1);

INSERT INTO user (firstName, lastName, userName, password, type)
VALUES ('Carsten','Hansen','hansen','1234', 2);

INSERT INTO course (courseTitle)
VALUE ('Distribuerede Systemer');

INSERT INTO course (courseTitle)
VALUE ('IT-Forandringsledelse');

INSERT INTO course (courseTitle)
VALUE ('Makroøkonomi');

INSERT INTO course (courseTitle)
VALUE ('Finansiering');

INSERT INTO user_course (user_id, course_id)
VALUES (1,1);

INSERT INTO user_course (user_id, course_id)
VALUES (1,2);

INSERT INTO user_course (user_id, course_id)
VALUES (1,3);

INSERT INTO user_course (user_id, course_id)
VALUES (1,4);

INSERT INTO user_course (user_id, course_id)
VALUES (2,1);

INSERT INTO user_course (user_id, course_id)
VALUES (2,2);

INSERT INTO user_course (user_id, course_id)
VALUES (2,3);

INSERT INTO user_course (user_id, course_id)
VALUES (2,4);

INSERT INTO quiz (quizTitle, course_id)
VALUES ('DIS QUIZ 1', 1);

INSERT INTO question (questionTitle, quiz_id)
VALUES ('Hvad hedder Henrik til efternavn?', 1);

INSERT INTO choice (choiceTitle, answer, question_id)
VALUES ('Thorn', 1, 1);

INSERT INTO choice (choiceTitle, answer, question_id)
VALUES ('Horn', 0, 1);

INSERT INTO choice (choiceTitle, answer, question_id)
VALUES ('Torn', 0, 1);

INSERT INTO choice (choiceTitle, answer, question_id)
VALUES ('Kawasaki', 0, 1);