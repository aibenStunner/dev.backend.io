CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `admin`@`%` 
    SQL SECURITY DEFINER
VIEW `public_camera_location` AS
    SELECT 
        `public_cameras`.`cameraId` AS `camera_ID`,
        `public_cameras`.`camera_name` AS `camera_name`,
        `public_cameras`.`camera_link` AS `camera_link`,
        `public_places`.`Location_name` AS `camera_location`
    FROM
        (`public_cameras`
        JOIN `public_places` ON ((`public_cameras`.`Location_ID` = `public_places`.`LocationID`)));
