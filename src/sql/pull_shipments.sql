-- name: pull_shipments?
-- returns shipment information
SELECT
    ship.id AS shipment_id,
    ship.num AS shipment_number,
    so.num AS so_number,
    so.customerPO AS customer_po_num,
    ship.shipToName AS ship_to_name,
    ship.shipToAddress AS ship_to_address,
    ship.shipToCity AS ship_to_city,
    (SELECT name FROM stateconst WHERE id = ship.shipToStateId) AS ship_to_state,
    ship.shipToZip AS ship_to_zip,
    (SELECT name FROM countryconst WHERE id = ship.shipToCountryId) AS ship_to_country,
    billToName AS bill_to_name,
    billToAddress AS bill_to_address,
    billToCity AS bill_to_city,
    (SELECT name FROM stateconst WHERE id = billToStateId) AS bill_to_state,
    billToZip AS bill_to_zip,
    (SELECT name FROM countryconst WHERE id = billTOCountryId) AS bill_to_country,
    ship.customFields AS custom_fields,
    ship.note AS special_instructions,
    (SELECT SUM(qtyShipped) FROM shipitem WHERE shipId = ship.id) as total_cases
FROM ship
    LEFT JOIN so ON ship.soId = so.id
WHERE
    ship.statusId IN (10, 20)