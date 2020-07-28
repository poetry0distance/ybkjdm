-- SET GLOBAL event_scheduler = 'NO';  
-- 事件名
CREATE EVENT IF NOT EXISTS event_create_table_every_mon
-- 间隔一个小时  
ON SCHEDULE EVERY 1 DAY
-- 第一次执行时间 立马执行
STARTS NOW() 
ON  COMPLETION  PRESERVE  
ENABLE 
DO 
CALL create_table_every_mon();
