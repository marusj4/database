DROP TABLE IF EXISTS news;
CREATE TABLE news(
	id SERIAL,
	user_id bigint unsigned,
    content varchar(1000),
    created_at datetime,
    
    INDEX news_idx(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS news_media;
CREATE TABLE news_media(
	news_id bigint unsigned,
    media_id bigint unsigned,
    
    INDEX news_media_idx(news_id, media_id),
    FOREIGN KEY (news_id) REFERENCES news(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS news_comment;
CREATE TABLE news_comment(
	id serial,
    news_id bigint unsigned,
	content varchar(500),
    user_id bigint unsigned,
    created_at datetime,
    
    INDEX news_comment_idx(id),
    FOREIGN KEY (news_id) REFERENCES news(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
