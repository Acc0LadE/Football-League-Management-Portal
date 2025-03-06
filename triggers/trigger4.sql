CREATE DEFINER=`root`@`localhost` TRIGGER `fixture_BEFORE_DELETE` BEFORE DELETE ON `fixture` FOR EACH ROW BEGIN
	IF OLD.Home_Score IS NOT NULL AND OLD.Away_Score IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a fixture with scores recorded.';
    END IF;
END