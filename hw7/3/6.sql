UPDATE Students
SET GroupId = (
    SELECT GroupId
    FROM Groups
    WHERE GroupName = :GroupName
)
WHERE GroupId = (
    SELECT GroupId
    FROM Groups
    WHERE GroupName = :FromGroupName
)
AND EXISTS (
    SELECT 1
    FROM Groups
    WHERE GroupName = :GroupName
);
