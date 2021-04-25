SELECT * FROM messages;

DELETE FROM messages
WHERE created_at > CURRENT_TIMESTAMP();