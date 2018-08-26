require_relative("../db/sql_runner")

class Artist

  attr_reader :name, :id

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO artists
    (name) VALUES ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end


end
