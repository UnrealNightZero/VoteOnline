-- Use Comment Encoding UTF-8 CRLF
-- 停用自動提交
SET autocommit = 0;
-- 投票項目表
CREATE TABLE vote_list (
    vote_id INT AUTO_INCREMENT PRIMARY KEY,
    vote_name VARCHAR(255) NOT NULL
);
-- 使用者表
CREATE TABLE vote_staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL UNIQUE,
    password_hash CHAR(60) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);
-- 投票紀錄表（建議外鍵用 staff_id，而非 user_name）
CREATE TABLE vote_record (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,          -- 參考 vote_staff(id)
    vote_id INT NOT NULL COMMENT ,  -- 參考 vote_list(vote_id)
    FOREIGN KEY (staff_id) REFERENCES vote_staff(id),
    FOREIGN KEY (vote_id) REFERENCES vote_list(vote_id)
);
COMMIT;