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


    Connection.destroy_all
    Interaction.destroy_all
    Relationship.destroy_all

    User.create(username: "DEP", password: "password")
    user = User.last
    #create and associate connections with relationship
    default_relationship =  Relationship.create!(status: "Acquaintance")
    Relationship.create(status: "Repeat Acquaintance")
    Relationship.create(status: "In-Network Contact")
    Relationship.create(status: "Colleague")



    connection1 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: default_relationship.id)
    connection2 = user.connections.create(name: "William",
                                 initial_meet: "10/12/12",
                                 organization: "navy", relationship_id: default_relationship.id)
    connection3 = user.connections.create(name: "Alex",
                                 initial_meet: "10/12/12",
                                 organization: "navy", relationship_id: default_relationship.id)
    connection4 = user.connections.create(name: "Beyonce",
                                 initial_meet: "10/12/12",
                                 organization: "navy", relationship_id: default_relationship.id)

    connection4 = user.connections.create(name: "Billy",
                                 initial_meet: "10/12/12",
                                 organization: "navy", relationship_id: default_relationship.id)


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



    connections = Connection.all
    connections.each do |connection|
      connection.relationship = Relationship.find(rand(Relationship.first.id..Relationship.last.id))
      connection.save!
    end


