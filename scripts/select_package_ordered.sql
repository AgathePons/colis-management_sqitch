SELECT 
package.id, 
serial_number,
content_description,
sender_id,
place.name AS expediteur,
recipient_id
FROM package
JOIN place 
ON package.sender_id=place.id OR package.recipient_id=place.id;
