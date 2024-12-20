select TeamName
from Teams
natural join Universities
where Universities.UnivName = :UnivName