INSERT INTO Runs (SessionId, Letter, SubmitTime, Accepted)
SELECT S.SessionId,
       R.Letter,
       max(R.SubmitTime) + 1 as NewSubmitTime,
       1 as Accepted
FROM Sessions S
JOIN Runs R on S.SessionId = R.SessionId
WHERE S.ContestId = :ContestId
AND NOT EXISTS (
    SELECT 1
    FROM Runs R2
    WHERE R2.SessionId = R.SessionId
    AND R2.Letter = R.Letter
    AND R2.Accepted = 1
)
GROUP BY S.SessionId, R.Letter;
