SELECT
    id AS carton_id,
    shipId AS shipment_id,
    cartonNum AS carton_number,
    len AS carton_length,
    width AS carton_width,
    height AS carton_height,
    freightWeight AS carton_weight,
    (SELECT SUM(qtyShipped * unitPrice) FROM shipitem LEFT JOIN soitem ON soitem.id = shipitem.soItemId WHERE shipCartonId = shipcarton.id) AS carton_value
FROM shipcarton
WHERE shipId IN (SELECT id FROM ship WHERE statusId IN (10,20))