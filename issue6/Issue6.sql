DROP TABLE member;

CREATE TABLE member (
                        member_id BIGINT NOT NULL AUTO_INCREMENT,
                        age INTEGER NOT NULL,
                        gender VARCHAR(255),
                        user_id VARCHAR(255),
                        username VARCHAR(255),
                        PRIMARY KEY (member_id)
) ENGINE=InnoDB;

# user_id index 생성
CREATE INDEX member_user_id_idx ON member(user_id);

INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'M', UUID(), UUID());
INSERT INTO member(age, gender, user_id, username) VALUES(FLOOR(RAND() * 40), 'WM', UUID(), UUID());


INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;
INSERT INTO member SELECT NULL, age, gender, user_id, username FROM member;

## 10223616개 데이터
SELECT COUNT(*) FROM member;

## index 사용유무
EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE user_id = '66021b8d-a52e-11ed-8256-f077c3e8710a';

SELECT SQL_NO_CACHE * FROM member WHERE user_id = '66021b8d-a52e-11ed-8256-f077c3e8710a';

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE username = '66021b8d-a52e-11ed-8256-f077c3e8710a';

SELECT SQL_NO_CACHE * FROM member WHERE username = '66021b8d-a52e-11ed-8256-f077c3e8710a';

## index 범위 검색 LIKE (1)
EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE user_id LIKE '66021b8d%';

SELECT SQL_NO_CACHE * FROM member
WHERE user_id LIKE '66021b8d%';

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE username LIKE '66021b8d%';

SELECT SQL_NO_CACHE * FROM member
WHERE username LIKE '66021b8d%';

## index 범위 검색 LIKE (2) 범위 all
EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE user_id LIKE '%66021b8d';

SELECT SQL_NO_CACHE * FROM member
WHERE user_id LIKE '%66021b8d';

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE username LIKE '%66021b8d';

SELECT SQL_NO_CACHE * FROM member
WHERE username LIKE '%66021b8d';

## index merge 비교 조건 효율성
CREATE INDEX member_age_gender_idx ON member(age, gender);
CREATE INDEX member_gender_age_idx  ON member(gender, age);

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE age > 20 and gender = 'M';

SELECT SQL_NO_CACHE * FROM member
WHERE age > 20 and gender = 'M';

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE gender = 'M' and age > 20;

SELECT SQL_NO_CACHE * FROM member
WHERE gender = 'M' and age > 20;

## 함수를 활용한 인덱스
CREATE INDEX member_username_gender_full_idx ON member((CONCAT(username, ' ',gender)));

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE CONCAT(username, ' ',gender) = '6609c989-a52e-11ed-8256-f077c3e8710a WM';

SELECT SQL_NO_CACHE * FROM member
WHERE CONCAT(username, ' ',gender) = '6609c989-a52e-11ed-8256-f077c3e8710a WM';

EXPLAIN
SELECT SQL_NO_CACHE * FROM member
WHERE CONCAT(username, ' ',UPPER(gender)) = '6609c989-a52e-11ed-8256-f077c3e8710a WM';

SELECT SQL_NO_CACHE * FROM member
WHERE CONCAT(username, ' ',UPPER(gender)) = '6609c989-a52e-11ed-8256-f077c3e8710a WM';


## 부모 / 자식 table 생성하기
SET AUTOCOMMIT = 0;

CREATE TABLE tb_parent (
                           id INT NOT NULL,
                           fd VARCHAR(100) NOT NULL, PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE tb_child (
                          id INT NOT NULL,
                          pid INT DEFAULT NULL,
                          fd VARCHAR(100) DEFAULT NULL,
                          PRIMARY KEY (id),
                          KEY ix_parent_id (pid),
                          CONSTRAINT child_ibfk_1 FOREIGN KEY (pid) REFERENCES tb_parent (id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO tb_parent VALUES (1, 'parent-1'), (2, 'parent-2');
INSERT INTO tb_child values (100, 1, 'child-100');

BEGIN;
UPDATE tb_parent
SET fd = 'changed-2' WHERE id = 1;

BEGIN;
UPDATE tb_child
SET pid = 2 WHERE id = 100;

COMMIT;


BEGIN;
UPDATE tb_parent
SET fd = 'parent-2' WHERE id = 1;

BEGIN;
UPDATE tb_child
SET pid = 1 WHERE id = 100;

ROLLBACK ;

BEGIN;
UPDATE tb_child
SET pid = 1 WHERE id = 100;

BEGIN;
DELETE FROM tb_parent
WHERE id = 1;

COMMIT ;

DROP TABLE tb_child;
DROP TABLE tb_parent;


CREATE TABLE tb_parent (
                           id INT NOT NULL,
                           fd VARCHAR(100) NOT NULL, PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE tb_child (
                          id INT NOT NULL,
                          pid INT DEFAULT NULL,
                          fd VARCHAR(100) DEFAULT NULL,
                          PRIMARY KEY (id),
                          KEY ix_parent_id (pid),
                          CONSTRAINT child_ibfk_1 FOREIGN KEY (pid) REFERENCES tb_parent (id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO tb_parent VALUES (1, 'parent-1'), (2, 'parent-2');
INSERT INTO tb_child values (100, 1, 'child-100');

BEGIN;
UPDATE tb_child
SET pid = 1 WHERE id = 100;

BEGIN;
DELETE FROM tb_parent
WHERE id = 1;

ROLLBACK ;

CREATE TABLE team (
                      team_id BIGINT NOT NULL AUTO_INCREMENT,
                      team_name VARCHAR(255),
                      team_register_id VARCHAR(255),
                      UNIQUE INDEX team_register_id_idx (team_register_id),
                      PRIMARY KEY (team_id)
);

CREATE TABLE user (
                      user_id BIGINT NOT NULL AUTO_INCREMENT,
                      username VARCHAR(255),
                      user_register_id VARCHAR(255),
                      team_id BIGINT DEFAULT NULL,
                      PRIMARY KEY (user_id),
                      UNIQUE INDEX user_register_id_idx (user_register_id),
                      CONSTRAINT user_ibfk_1 FOREIGN KEY (team_id) REFERENCES team (team_id) ON DELETE CASCADE
);

DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert$$

CREATE PROCEDURE loopInsert()

BEGIN
            DECLARE i INT DEFAULT 1;

            WHILE i <= 100 DO

                INSERT INTO team(team_name, team_register_id) VALUES('TEAM_A', i);
                SET i = i + 1;

END WHILE;

END $$
DELIMITER $$;

CALL loopInsert;
commit;


DELIMITER $$
DROP PROCEDURE IF EXISTS loopInsert$$

CREATE PROCEDURE loopInsert()

BEGIN
        DECLARE i INT DEFAULT 1;

        WHILE i <= 100000 DO

                INSERT INTO user(username, user_register_id, team_id) VALUES(i, i, CEILING(i / 1000));
                SET i = i + 1;
END WHILE;
END;
DELIMITER $$;

CALL loopInsert;
commit;

select count(*) from user;

EXPLAIN
SELECT u.* from user as u
                    inner join team as t
                               on u.team_id = t.team_id
where u.user_register_id > 100;

SELECT sql_no_cache u.* from user as u
                                 inner join team as t
                                            on u.team_id = t.team_id
where u.user_register_id > 100;

EXPLAIN
SELECT sql_no_cache u.* from user as u
                                 inner join team as t
                                            on u.team_id = t.team_id
where u.username > 100;


EXPLAIN
SELECT u.* from user as u
where u.team_id in (
    select team_id from team
) and u.user_register_id > 100;

SELECT sql_no_cache u.* from user as u
where u.team_id in (
    select team_id from team
) and u.user_register_id > 100;

EXPLAIN
SELECT sql_no_cache u.* from user as u
where u.team_id in (
    select team_id from team
) and u.username > 100;

SELECT sql_no_cache u.* from user as u
where u.team_id in (
    select team_id from team
) and u.username > 100;
