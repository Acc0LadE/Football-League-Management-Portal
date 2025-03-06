CREATE DEFINER=`root`@`localhost` TRIGGER `fixture_AFTER_INSERT` AFTER INSERT ON `fixture` FOR EACH ROW BEGIN
    -- For Home Team: Update Wins/Losses
    IF NEW.Home_Score > NEW.Away_Score THEN
        -- Home team wins, away team loses
        UPDATE CLUB
        SET wins = wins + 1, home_wins = home_wins + 1
        WHERE Club_ID = NEW.Home_Team_ID;
        
        UPDATE CLUB
        SET losses = losses + 1, away_losses = away_losses + 1
        WHERE Club_ID = NEW.Away_Team_ID;

    ELSEIF NEW.Home_Score < NEW.Away_Score THEN
        -- Away team wins, home team loses
        UPDATE CLUB
        SET losses = losses + 1, home_losses = home_losses + 1
        WHERE Club_ID = NEW.Home_Team_ID;
        
        UPDATE CLUB
        SET wins = wins + 1, away_wins = away_wins + 1
        WHERE Club_ID = NEW.Away_Team_ID;

    ELSE
        -- Draw (Both teams get a draw point, no wins or losses)
        UPDATE CLUB
        SET draws = draws + 1, home_draws = home_draws + 1
        WHERE Club_ID = NEW.Home_Team_ID;
        
        UPDATE CLUB
        SET draws = draws + 1, away_draws = away_draws + 1
        WHERE Club_ID = NEW.Away_Team_ID;
    END IF;
END