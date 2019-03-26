class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
  	create_table :barbers do |t|
	    t.text :name
	    t.timestamps
  	end	
  	Barber.create :name => 'Юра'
  	Barber.create :name => 'Миша'
  	Barber.create :name => 'Марина'
  	Barber.create :name => 'Тема'
  end
end
 