require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp



def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type

end

def self.save(name, type, db)
db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end


def self.find(id, db)
pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
new_pokemon = self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
end

def self.find(id_num, db)
db.execute("SELECT * FROM pokemon WHERE id = ?", [id_num])
end

# def alter_hp(num, db)
#    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
#    self.hp = num
#  end

end
