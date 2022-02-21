SELECT 
package.id, 
serial_number,
content_description,
sender_id,
expediteur.name AS expediteur,
recipient_id,
receveur.name AS receveur
FROM package
JOIN place AS expediteur ON expediteur.id = package.sender_id
JOIN place AS receveur ON receveur.id = package.recipient_id