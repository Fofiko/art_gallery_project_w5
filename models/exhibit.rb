require_relative("../db/sql_runner")

class Exhibit

  attr_reader :title, :category, :artist_id, :id

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @title = info['title']
    @category = info['category']
    @artist_id = info['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO exhibits
    (title, category, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@title, @category, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE exhibits
    SET (title, category, artist_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@title, @category, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM exhibits
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    exhibits = SqlRunner.run(sql)
    result = exhibits.map { |exhibit| Exhibit.new(exhibit) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM exhibits
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Exhibit.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end


end
