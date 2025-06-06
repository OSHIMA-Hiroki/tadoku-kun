class SeedSegBooks < ActiveRecord::Migration[7.1]
  def up
    # FRL (Foundations Reading Library)
    Book.create!([
      { title: "FRL Level 1", author: "Rob Waring", yomiyasusa_level: "0.5-1.0", word_count: "500-1000" },
      { title: "FRL Level 2", author: "Rob Waring", yomiyasusa_level: "0.8-1.2", word_count: "800-1500" },
      { title: "FRL Level 3", author: "Rob Waring", yomiyasusa_level: "1.0-1.4", word_count: "1200-3000" }
    ])

    # Penguin Readers Easystarts (PGR0)
    Book.create!([
      { title: "Marcel and the Mona Lisa", author: "Stephen Rabley", yomiyasusa_level: "0.8", word_count: "900" },
      { title: "Pebbles on the Beach", author: "Elizabeth Laird", yomiyasusa_level: "0.8", word_count: "900" },
      { title: "The Leopard and the Lighthouse", author: "Anne Collins", yomiyasusa_level: "0.8", word_count: "900" }
    ])

    # Oxford Bookworms Starters (OBW0)
    Book.create!([
      { title: "Escape", author: "Phillip Burrows", yomiyasusa_level: "0.8", word_count: "700" },
      { title: "Drive into Danger", author: "Rosemary Border", yomiyasusa_level: "0.9", word_count: "1500" },
      { title: "Shirley Homes and the Cyber Thief", author: "Jennifer Bassett", yomiyasusa_level: "0.9", word_count: "1500" }
    ])

    # Penguin Readers Level 1 (PGR1)
    Book.create!([
      { title: "A Little Princess", author: "Frances Hodgson Burnett", yomiyasusa_level: "1.0", word_count: "1300" },
      { title: "Dantes Peak", author: "Dewey Gram", yomiyasusa_level: "1.2", word_count: "2800" },
      { title: "Forrest Gump", author: "Winston Groom", yomiyasusa_level: "1.4", word_count: "4400" }
    ])

    # Cambridge English Readers Level 1 (CER1)
    Book.create!([
      { title: "The Big Picture", author: "Sue Leather", yomiyasusa_level: "1.4", word_count: "3400" },
      { title: "Help!", author: "Philip Prowse", yomiyasusa_level: "1.5", word_count: "4000" },
      { title: "The Man from Nowhere", author: "Bernard Smith", yomiyasusa_level: "1.6", word_count: "4800" }
    ])

    # I Can Read Books Level 2 (ICR2)
    Book.create!([
      { title: "Frog and Toad Are Friends", author: "Arnold Lobel", yomiyasusa_level: "1.2", word_count: "1500" },
      { title: "Amelia Bedelia", author: "Peggy Parish", yomiyasusa_level: "1.4", word_count: "1800" },
      { title: "Henry and Mudge", author: "Cynthia Rylant", yomiyasusa_level: "1.6", word_count: "2000" }
    ])

    # Magic Tree House (MTH)
    Book.create!([
      { title: "Dinosaurs Before Dark", author: "Mary Pope Osborne", yomiyasusa_level: "2.5", word_count: "4900" },
      { title: "The Knight at Dawn", author: "Mary Pope Osborne", yomiyasusa_level: "2.8", word_count: "5200" },
      { title: "Mummies in the Morning", author: "Mary Pope Osborne", yomiyasusa_level: "3.0", word_count: "5500" },
      { title: "Pirates Past Noon", author: "Mary Pope Osborne", yomiyasusa_level: "3.2", word_count: "5800" },
      { title: "Night of the Ninjas", author: "Mary Pope Osborne", yomiyasusa_level: "3.5", word_count: "6100" }
    ])

    # Roald Dahl Series (RDS)
    Book.create!([
      { title: "The Witches", author: "Roald Dahl", yomiyasusa_level: "5.0", word_count: "30000" },
      { title: "Matilda", author: "Roald Dahl", yomiyasusa_level: "5.5", word_count: "35000" },
      { title: "Charlie and the Chocolate Factory", author: "Roald Dahl", yomiyasusa_level: "6.0", word_count: "43000" }
    ])

    # Harry Potter Series
    Book.create!([
      { title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", yomiyasusa_level: "6.0", word_count: "77000" },
      { title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", yomiyasusa_level: "6.5", word_count: "85000" },
      { title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", yomiyasusa_level: "7.0", word_count: "107000" },
      { title: "Harry Potter and the Goblet of Fire", author: "J.K. Rowling", yomiyasusa_level: "7.5", word_count: "191000" },
      { title: "Harry Potter and the Order of the Phoenix", author: "J.K. Rowling", yomiyasusa_level: "8.0", word_count: "257000" }
    ])

    # Additional popular series
    Book.create!([
      { title: "A to Z Mysteries: The Absent Author", author: "Ron Roy", yomiyasusa_level: "2.0", word_count: "6000" },
      { title: "Marvin Redpost: Kidnapped at Birth?", author: "Louis Sachar", yomiyasusa_level: "2.5", word_count: "8000" },
      { title: "Junie B. Jones and the Stupid Smelly Bus", author: "Barbara Park", yomiyasusa_level: "2.8", word_count: "7500" },
      { title: "Encyclopedia Brown, Boy Detective", author: "Donald J. Sobol", yomiyasusa_level: "3.5", word_count: "12000" },
      { title: "The BFG", author: "Roald Dahl", yomiyasusa_level: "4.5", word_count: "35000" }
    ])
  end

  def down
    # Delete all books created by this migration
    Book.where(title: [
      # FRL
      "FRL Level 1", "FRL Level 2", "FRL Level 3",
      # PGR0
      "Marcel and the Mona Lisa", "Pebbles on the Beach", "The Leopard and the Lighthouse",
      # OBW0
      "Escape", "Drive into Danger", "Shirley Homes and the Cyber Thief",
      # PGR1
      "A Little Princess", "Dantes Peak", "Forrest Gump",
      # CER1
      "The Big Picture", "Help!", "The Man from Nowhere",
      # ICR2
      "Frog and Toad Are Friends", "Amelia Bedelia", "Henry and Mudge",
      # MTH
      "Dinosaurs Before Dark", "The Knight at Dawn", "Mummies in the Morning", 
      "Pirates Past Noon", "Night of the Ninjas",
      # RDS
      "The Witches", "Matilda", "Charlie and the Chocolate Factory",
      # Harry Potter
      "Harry Potter and the Philosopher's Stone", "Harry Potter and the Chamber of Secrets",
      "Harry Potter and the Prisoner of Azkaban", "Harry Potter and the Goblet of Fire",
      "Harry Potter and the Order of the Phoenix",
      # Additional
      "A to Z Mysteries: The Absent Author", "Marvin Redpost: Kidnapped at Birth?",
      "Junie B. Jones and the Stupid Smelly Bus", "Encyclopedia Brown, Boy Detective",
      "The BFG"
    ]).destroy_all
  end
end