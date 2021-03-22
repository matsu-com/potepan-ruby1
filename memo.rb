require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp
  puts "メモしたい内容をを入力し、完了したらCtrl+dを入力してください。"
  CSV.open("#{memo_name}.csv", "w") do |writing|
    memo_contents = readlines.map(&:chomp)
    puts memo_contents
    writing << memo_contents
  end
elsif memo_type == 2
  puts "既存のメモの拡張子を除いたファイル名を入力してください"
  memo_name = gets.chomp
  puts "メモしたい内容をを入力し、完了したらCtrl+dを入力してください。"
  CSV.open("#{memo_name}.csv", "a") do |writing|
    memo_contents = readlines.map(&:chomp)
    puts memo_contents
    writing << memo_contents
  end
else
  puts "1、2以外が入力されています。入力を確認してください"
end