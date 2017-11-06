# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  #schema http://ondras.zarovi.cz/sql/demo/?keyword=dphilla_net_work
#
#
    user =  User.create(username: "DEP", password: "password")


    Connection.destroy_all
    Interaction.destroy_all
    Relationship.destroy_all


    connection1 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
    connection2 = user.connections.create(name: "William",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
    connection3 = user.connections.create(name: "Alex",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
    connection4 = user.connections.create(name: "Beyonce",
                                 initial_meet: "10/12/12",
                                 organization: "navy")

    connection4 = user.connections.create(name: "Billy",
                                 initial_meet: "10/12/12",
                                 organization: "navy")


    connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")
   connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")
   connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")
   connection3.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection4.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")
       connection3.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection4.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")


    #create and associate connections with relationship
    Relationship.create(status: "Acquaintance")
    Relationship.create(status: "Repeat Acquaintance")
    Relationship.create(status: "In-Network Contact")
    Relationship.create(status: "Colleague")

    connections = Connection.all
    connections.each do |connection|
      connection.relationship = Relationship.find(rand(Relationship.first.id..Relationship.last.id))
      connection.save!
    end


