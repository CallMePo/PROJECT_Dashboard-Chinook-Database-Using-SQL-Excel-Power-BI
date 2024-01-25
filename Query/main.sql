SELECT 
    invo.InvoiceId,
    ili.InvoiceLineId,
    invo.CustomerId,
    CONCAT(cus.FirstName, ' ', cus.LastName) AS FullName,
    cus.Country,
    tr.Name as TrackName,
	alb.Title as AlbumName,
	art.Name as Artist,
	gr.Name as Genre,
    /* Tambah Genre
    Tambah Artis*/
    ili.Quantity,
    ili.UnitPrice,
    invo.InvoiceDate,
    invo.Total
FROM 
    invoice invo
    JOIN invoiceline ili ON ili.InvoiceId = invo.InvoiceId
    JOIN customer cus ON invo.CustomerId = cus.CustomerId
    JOIN track tr ON tr.TrackId = ili.TrackId
	JOIN genre gr ON gr.GenreId=tr.GenreId
	JOIN album alb ON alb.AlbumId=tr.AlbumId
	JOIN artist art ON art.ArtistId=alb.ArtistId
GROUP BY
    invo.InvoiceId,
    ili.InvoiceLineId,
    invo.CustomerId,
    CONCAT(cus.FirstName, ' ', cus.LastName),
    cus.Country,
    tr.Name,
	alb.Title,
	art.Name,
	gr.Name,
    ili.Quantity,
    ili.UnitPrice,
    invo.InvoiceDate,
    invo.Total;
