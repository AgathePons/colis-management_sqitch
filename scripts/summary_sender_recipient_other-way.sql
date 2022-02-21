SELECT 
package.id, 
serial_number,
content_description,
sender_id,
(SELECT name FROM place WHERE place.id=package.sender_id) AS expediteur,
recipient_id,
(SELECT name FROM place WHERE place.id=package.recipient_id) AS destinataire
FROM package;