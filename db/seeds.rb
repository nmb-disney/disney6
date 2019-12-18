# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
# 	email: 'disney6@gmail.com',
# 	password: '000000',
# 	password_confirmation: '000000',
# 	)

User.create!(
	lastname: '川本',
	firstname: '梨紗',
	lastname_kana: 'カワモト',
	firstname_kana: 'リサ',
	postalcode: '111-1111',
	address: '大阪府大阪市大阪町1-1-1',
	phone: '111-1111-1111',
	email: 'kawamotorisa@gmail.com',
	password: '111111',
	password_confirmation: '111111',
	)

User.create!(
	lastname: '平松',
	firstname: '幹雄',
	lastname_kana: 'ヒラマツ',
	firstname_kana: 'ミキオ',
	postalcode: '222-2222',
	address: '大阪府大阪市大阪町2-2-2',
	phone: '222-2222-2222',
	email: 'hiramatumikio@gmail.com',
	password: '222222',
	password_confirmation: '222222',
	)

User.create!(
	lastname: '美坂',
	firstname: '朱里',
	lastname_kana: 'ミサカ',
	firstname_kana: 'シュリ',
	postalcode: '333-3333',
	address: '大阪府大阪市大阪町3-3-3',
	phone: '333-3333-3333',
	email: 'misakasyuri@gmail.com',
	password: '333333',
	password_confirmation: '333333',
	)

User.create!(
	lastname: '吉田',
	firstname: '悠祐',
	lastname_kana: 'ヨシダ',
	firstname_kana: 'ユウスケ',
	postalcode: '444-4444',
	address: '大阪府大阪市大阪町4-4-4',
	phone: '444-4444-4444',
	email: 'yosidayuusuke@gmail.com',
	password: '444444',
	password_confirmation: '444444',
	)

Address.create!(
	user_id: "1",
	add_postalcode: '555-5555',
	add_address: '大阪府大阪市大阪町5-5-5',
	add_lastname: '大阪',
	add_firstname: '太郎'
	)

Artist.create!(
	artist_name: '嵐'
	)

Label.create!(
	label_name: 'ジャニーズ'
	)

Genre.create!(
	genre_name: 'JーPOP'
	)

Cd.create!(
	artist_id: "1",
	label_id: "1",
	genre_id: "1",
	cd_title: 'A・RA・SHI  THE BEST',
	release_date: '2019-12-18',
	jacket_image_id: open("./app/assets/images/no_image.jpg"),
	price: "2100",
	status: "20"
	)

Review.create!(
	cd_id: "1",
	user_id: "1",
	comment: 'コメント'
	)

Interest.create!(
	cd_id: "1",
	user_id: "1"
	)

Cart_cd.create!(
	cd_id: "1",
	user_id: "1",
	cart_count:"1"
	)

Order.create!(
	user_id: "1",
	payment: '現金',
	total: "2500",
	deliver_fee: "800",
	deliver_status: "20",
	order_count: "1",
	tax: "80"
	)

Order_cd.create!(
	cd_id: "1",
	order_id: "1",
	order_cd_count: "1"
	)

Disc.create!(
	cd_id: "1",
	disc_rank: "1",
	disc_title: 'A・RA・SHI'
	)

Music.create!(
	disc_id: "1",
	music_rank: "1",
	music_title: 'SHI ・RA ・ A'
	)

Restock.create!(
	cd_id: "1",
	restock_count: "1"
	)

Admin.create!(
	admin_email: 'aaaaaa@gmail.com',
	admin_password: '666666'
	)