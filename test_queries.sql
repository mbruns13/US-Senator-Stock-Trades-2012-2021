SELECT * FROM trades;

SELECT senator, owner, party, ticker, dateoftrade, rangeoftransactionvalue
FROM trades
WHERE owner = 'Self';

SELECT senator, owner, party, ticker, dateoftrade, rangeoftransactionvalue
FROM trades
WHERE owner = 'Spouse';

SELECT senator, owner, party, ticker, dateoftrade, rangeoftransactionvalue
FROM trades
WHERE owner = 'Child';

SELECT rangeoftransactionvalue, COUNT(senator)
FROM trades
WHERE owner = 'Self'
GROUP BY rangeoftransactionvalue
ORDER BY COUNT(senator) DESC;

SELECT party, COUNT(senator)
FROM trades
WHERE owner = 'Self'
GROUP BY party
ORDER BY COUNT(senator) DESC;