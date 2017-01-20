CREATE TABLE `VideoAnnotation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `video_id` varchar(50) NOT NULL DEFAULT '',
  `coordinates` varchar(100) NOT NULL DEFAULT '0,0,100,100',
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(500) NOT NULL DEFAULT '',
  `start_time` int unsigned DEFAULT 0,
  `end_time` int unsigned DEFAULT 0,
  `url` varchar(500) DEFAULT '',
  `image_url` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Chevrolet ZR2', '20, 5, 80, 50', 25000, 38000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Honda Civic Si', '20, 5, 80, 50', 40000, 51000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Alfa Romeo Stelvio', '5, 5, 80, 80', 53000, 71000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Juguar I-Pace', '35, 35, 35, 35', 72000, 85000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Porsche 911 RSR', '35, 35, 50, 50', 86000, 99000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('F4g7IQWicAg', 'Auto', 'Toyota C-HR', '20, 5, 50, 50', 100000, 109000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('lKLBmF-B0I4', 'Attraction', 'Nice France', '0, 0, 100, 100', 0, 30000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('lKLBmF-B0I4', 'Attraction', 'Aix-en-Provence France', '0, 0, 100, 100',
				33000, 79000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('lKLBmF-B0I4', 'Attraction', 'Marseille France', '0, 0, 100, 100', 81000,
				160000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('lKLBmF-B0I4', 'Attraction', 'Carcassonne France', '0, 0, 100, 100',
				167000, 190000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('lKLBmF-B0I4', 'Attraction', 'Montpellier France', '0, 0, 100, 100',
				193000, 208000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Felicity Jones', '40, 0, 20, 100',
				6000, 7000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Forest Whitaker', '40, 0, 50, 100',
				7000, 8000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Felicity Jones', '40, 0, 20, 100',
				18000, 40000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Diego Luna', '40, 0, 20, 100',
				20000, 42000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Wen Jiang', '30, 0, 40, 100',
				47000, 50000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Donnie Yen', '50, 10, 20, 90',
				53000, 59000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Felicity Jones', '50, 20, 20, 80',
				60000, 64000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Alan Tudyk', '0, 0, 50, 100',
				60000, 64000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Toy', 'K-2SO', '0, 0, 50, 100',
				60000, 64000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Toy', 'Death Star', '10, 0, 40, 90',
				67000, 70000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Toy', 'X-Wing', '50, 0, 30, 70',
				90000, 93000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Actor', 'Felicity Jones', '40, 0, 20, 100',
				97000, 110000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time) values ('frdj1zb9sMY', 'Toy', 'Darth Vader', '40, 0, 30, 100',
				1160000, 118000);
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 0, 6000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 20000, 65000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Scott', '0, 0, 100, 100', 34000, 70000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Mingbo', '0, 0, 100, 100', 34000, 50000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 71000, 86000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Mingbo', '0, 0, 100, 100', 87000, 110000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Scott', '0, 0, 100, 100', 90000, 95000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 110000, 147000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Mingbo', '0, 0, 100, 100', 130000, 147000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Scott', '0, 0, 100, 100', 130000, 185000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 187000, 242000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Scott', '0, 0, 100, 100', 187000, 190000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Mingbo', '0, 0, 100, 100', 187000, 190000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Mingbo', '0, 0, 100, 100', 242000, 252000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'People', 'Piers Solomon', '0, 0, 100, 100', 248000, 258000, 
				'http://www.pierssolomon.com/about/', 
				'https://static1.squarespace.com/static/555dd299e4b0c1834b5b550c/t/5637c3bae4b018ccb36dea9d/1446495168731/?format=1500w');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Sponsor', 'Patagonia', '0, 0, 100, 100', 0, 280000, 
				'http://www.patagonia.com/home/', 
				'http://www.patagonia.com/static/on/demandware.static/Sites-patagonia-us-Site/-/default/dwceed69ad/images/logo.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Song', 'Portugal. The Man - Plastic Soldiers﻿', '0, 0, 100, 100', 0, 280000, 
				'https://www.amazon.com/Plastic-Soldiers/dp/B00CW54Z5M', 
				'https://images-na.ssl-images-amazon.com/images/I/51XQywmFasL._SS500_PJStripe-Robin-Large,TopLeft,0,0.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Location', 'Japan﻿', '0, 0, 100, 100', 7000, 91000, 
				'https://www.expedia.com/', 
				'https://www.expedia.com/_dms/header/logo.svg?locale=en_US&siteid=1');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Location', 'British Columbia, Canada', '0, 0, 100, 100', 91000, 175000, 
				'https://www.expedia.com/', 
				'https://www.expedia.com/_dms/header/logo.svg?locale=en_US&siteid=1');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Location', 'Switzerland', '0, 0, 100, 100', 175000, 259000, 
				'https://www.expedia.com/', 
				'https://www.expedia.com/_dms/header/logo.svg?locale=en_US&siteid=1');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'Patagonia Jacket', '0, 0, 100, 100', 31000, 257000, 
				'http://www.patagonia.com/product/mens-refugitive-jacket/83615.html?dwvar_83615_color=TRUT&cgid=sport-skiing-snowboarding-mens-jackets-vests#tile-1=&start=1&sz=24', 
				'http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw9c374d79/images/hi-res/83615_BSRB.jpg?sw=750&sh=750&sm=fit&sfrm=png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'Patagonia Backpack', '0, 0, 100, 100', 40000, 45000, 
				'http://www.patagonia.com/shop/luggage-backpacks', 
				'http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw68bc3af7/images/hi-res/48190_NBEB.jpg?sw=500&sh=500&sfrm=png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'Patagonia Backpack', '0, 0, 100, 100', 52000, 58000, 
				'http://www.patagonia.com/shop/luggage-backpacks', 
				'http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw68bc3af7/images/hi-res/48190_NBEB.jpg?sw=500&sh=500&sfrm=png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'ABS Backpack', '0, 0, 100, 100', 60000, 63000, 
				'https://www.abs-airbag.com/us/abs-backpack.html', 
				'https://www.abs-airbag.com/abs-media/produkte_2014_2015/340x366/VARIO/Base_Unit/ABS_PRODUCTS_2014_WEB_340x366_Baseunit_Vario8_Blackorange_faded.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'Patagonia Backpack', '0, 0, 100, 100', 63000, 70000, 
				'http://www.patagonia.com/shop/luggage-backpacks', 
				'http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw68bc3af7/images/hi-res/48190_NBEB.jpg?sw=500&sh=500&sfrm=png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'DPS Skis', '0, 0, 100, 100', 63000, 75000, 
				'http://www.dpsskis.com/en/', 
				'http://www.dpsskis.com/media/catalog/product/cache/1/small_image/9df78eab33525d08d6e5fb8d27136e95/s/p/spoon_710x213.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'DPS Skis', '0, 0, 100, 100', 79000, 103000, 
				'http://www.dpsskis.com/en/', 
				'http://www.dpsskis.com/media/catalog/product/cache/1/small_image/9df78eab33525d08d6e5fb8d27136e95/l/1/l124.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'DPS Skis', '0, 0, 100, 100', 107000, 137000, 
				'http://www.dpsskis.com/en/', 
				'http://www.dpsskis.com/media/catalog/product/cache/1/small_image/9df78eab33525d08d6e5fb8d27136e95/l/o/lotus120_710x213_2.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'DPS Skis', '0, 0, 100, 100', 145000, 257000, 
				'http://www.dpsskis.com/en/', 
				'http://www.dpsskis.com/media/catalog/product/cache/1/small_image/9df78eab33525d08d6e5fb8d27136e95/l/o/lotus120_710x213_2.png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('IqFJJb7FV8k', 'Merchandise', 'Patagonia Backpack', '0, 0, 100, 100', 112000, 157000, 
				'http://www.patagonia.com/shop/luggage-backpacks', 
				'http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dw68bc3af7/images/hi-res/48190_NBEB.jpg?sw=500&sh=500&sfrm=png');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Movie ticket', 'Rogue One: A Star Wars Story', '0, 0, 100, 100', 0, 95000, 
				'http://www.fandango.com/rogue-one:a-star-wars-story_187530/movieoverview', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEwMzMxODIzOV5BMl5BanBnXkFtZTgwNzg3OTAzMDI@._V1_SX214_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 5000, 9000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 12000, 21000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'Death Star', '0, 0, 100, 100', 12000, 21000, 
				'https://www.amazon.com/Star-Wars-Rogue-Titanium-Vehicle/dp/B01AWFTSNC/ref=sr_1_5?ie=UTF8&qid=1484181844&sr=8-5&`key`words=death+star', 
				'https://images-na.ssl-images-amazon.com/images/I/71Yt6OHYqEL._AC_UL115_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Diego Luna', '0, 0, 100, 100', 20000, 21000, 
				'http://www.imdb.com/name/nm0526019/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BOTE0MjI2NDczMl5BMl5BanBnXkFtZTcwMTgwMDgyMg@@._V1_UY317_CR2,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Donnie Yen', '0, 0, 100, 100', 21000, 22000, 
				'http://www.imdb.com/name/nm0526019/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BOTE0MjI2NDczMl5BMl5BanBnXkFtZTcwMTgwMDgyMg@@._V1_UY317_CR2,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Wen Jiang', '0, 0, 100, 100', 23000, 25000, 
				'http://www.imdb.com/name/nm0422638/?ref_=nv_sr_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2NTUyODA1N15BMl5BanBnXkFtZTgwODIzOTQ0OTE@._V1_UY317_CR5,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'K-2SO', '0, 0, 100, 100', 25000, 29000, 
				'https://www.amazon.com/Star-Wars-Black-Rogue-K-2SO/dp/B01943RXYY/ref=sr_1_1?s=toys-and-games&ie=UTF8&qid=1484182161&sr=1-1&`key`words=K-2SO', 
				'https://images-na.ssl-images-amazon.com/images/I/71HFF3eK5SL._SL1500_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 26000, 30000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'TIE Fighter', '0, 0, 100, 100', 30000, 31000, 
				'https://www.amazon.com/Hot-Wheels-Starship-Vehicle-Fighter/dp/B01CVC9N3E/ref=sr_1_2?s=toys-and-games&ie=UTF8&qid=1484182300&sr=1-2&`key`words=TIE+fighter', 
				'https://images-na.ssl-images-amazon.com/images/I/51zKnhaLxyL._AC_US320_FMwebp_QL65_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'Darth Vader', '0, 0, 100, 100', 39000, 41000, 
				'https://www.amazon.com/Star-Wars-Deluxe-Action-Lightsaber/dp/B01BUS2M6K/ref=sr_1_2?s=toys-and-games&ie=UTF8&qid=1484182492&sr=1-2&`key`words=darth+vader', 
				'https://images-na.ssl-images-amazon.com/images/I/41Nmg79n+9L._AC_US320_QL65_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'K-2SO', '0, 0, 100, 100', 42000, 48000, 
				'https://www.amazon.com/Star-Wars-Black-Rogue-K-2SO/dp/B01943RXYY/ref=sr_1_1?s=toys-and-games&ie=UTF8&qid=1484182161&sr=1-1&`key`words=K-2SO', 
				'https://images-na.ssl-images-amazon.com/images/I/71HFF3eK5SL._SL1500_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 42000, 48000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Donnie Yen', '0, 0, 100, 100', 49000, 54000, 
				'http://www.imdb.com/name/nm0526019/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BOTE0MjI2NDczMl5BMl5BanBnXkFtZTcwMTgwMDgyMg@@._V1_UY317_CR2,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Wen Jiang', '0, 0, 100, 100', 54000, 61000, 
				'http://www.imdb.com/name/nm0422638/?ref_=nv_sr_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2NTUyODA1N15BMl5BanBnXkFtZTgwODIzOTQ0OTE@._V1_UY317_CR5,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 61000, 62000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Toy', 'X-Wing', '0, 0, 100, 100', 62000, 80000, 
				'https://www.amazon.com/Star-Wars-X-Wing-Expansion-Pack/dp/1616613777/ref=sr_1_3?s=toys-and-games&ie=UTF8&qid=1484182615&sr=1-3&`key`words=X-Wing', 
				'https://images-na.ssl-images-amazon.com/images/I/41ZANEUx4NL._AC_US320_FMwebp_QL65_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Felicity Jones', '0, 0, 100, 100', 68000, 74000, 
				'http://www.imdb.com/name/nm0428065/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA0MTIwMzIyN15BMl5BanBnXkFtZTgwNDEyMzg1NDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Donnie Yen', '0, 0, 100, 100', 83000, 89000, 
				'http://www.imdb.com/name/nm0526019/?ref_=fn_al_nm_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BOTE0MjI2NDczMl5BMl5BanBnXkFtZTcwMTgwMDgyMg@@._V1_UY317_CR2,0,214,317_AL_.jpg');
		insert into VideoAnnotation (video_id, `key`, `value`, coordinates, start_time, end_time, url, image_url) values ('YWNvdoRnNv8', 'Actor', 'Wen Jiang', '0, 0, 100, 100', 83000, 89000, 
				'http://www.imdb.com/name/nm0422638/?ref_=nv_sr_1', 
				'https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2NTUyODA1N15BMl5BanBnXkFtZTgwODIzOTQ0OTE@._V1_UY317_CR5,0,214,317_AL_.jpg');
	
