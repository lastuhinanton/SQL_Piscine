UPDATE menu
SET price = (menu.price * 0.9)
WHERE pizza_name = 'greek pizza'