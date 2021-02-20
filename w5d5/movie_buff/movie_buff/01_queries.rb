def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3

  Movie.select(:id, :title, :score).where(score: 2..3)

end


def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor

  #ID, TITLE
  #Where Harrison Ford is an Actor, but is not the leader actor

  #ID, TITLE
  #Where harrison ford is just in the movie

  Movie.select(:id, :title).joins(:actors).where(actors: {name: "Harrison Ford"}).where.not("ord = 1")

end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)

  ## Find id and title of movie
  ## Limit of 3
  ## Count of cast COUNT(actor_id)
  ## group_by (movie_id) to get a count of actors in each 
  ## order decending (DESC)
  ## Movie -> Casting join castings

  Movie.select(:id, :title).joins(:castings).group("movies.id").order('COUNT(actor_id) DESC').limit(3)

end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.

  #find and ID and Title of a movie
  #use director_id to get ['George Lucas', 'Steven Spielberg']
  #join Movies on director 
  #where name in THEM
  Movie.select(:id, :title).joins(:director).where(actors: {name: them})




end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.

  #select movie names
  #use the pluck
  #select titles from movies where yr < 1941

  Movie.where("yr < 1940").pluck(:title)

end

# Chirp.joins(:likes).group(:id).having('COUNT(*) >= ?', 3).pluck(:body)
