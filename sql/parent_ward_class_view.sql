CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `parent_ward_class` AS
    SELECT 
        `parent`.`username` AS `username`,
        `parent`.`parentId` AS `parentId`,
        `ward`.`wardId` AS `wardId`,
        `ward`.`wardName` AS `wardName`,
        `class`.`classId` AS `classId`,
        `class`.`className` AS `className`
    FROM
        ((`parent`
        JOIN `ward` ON ((`parent`.`parentId` = `ward`.`parentId`)))
        JOIN `class` ON ((`ward`.`classId` = `class`.`classId`)))