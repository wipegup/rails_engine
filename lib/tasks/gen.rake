

namespace :gen do
  desc "call rails gen"
  task def: :environment do

    # `rails g active_record:migration CreateReview name:string`
  end

  desc "it"
  task do: :environment do
    # binding.pry
    include DatabaseBuilder
    puts table "Big", {"this"=>"that", it: :is}
  end
end
