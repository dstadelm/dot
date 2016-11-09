#!/usr/bin/env ruby
#


class Etest
  def initialize
    @users = ["Daniel", "Mark", "Stefan", "Melchior"]
    @relation = {"Daniel" => 153, "Mark" => 1254, "Stefan" => 36526, "Melchior" => 3252365}
  end

  def each_user
    return to_enum(:each_user) unless block_given?
    @users.each do |user|
      yield user
    end
  end

  def each_relation
    return to_enum(:each_relation) unless block_given?
    @relation.each do |key,value|
      yield key, value
    end
  end

end


if __FILE__ == $0

  t = Etest.new

  a = t.each_user.collect { |u| "-- " + u + " --" }
  puts a

  t.each_relation do |key, value|
    puts "KEY = #{key} \t Value = #{value}"
  end
end
