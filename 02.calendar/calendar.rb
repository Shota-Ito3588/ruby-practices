require "date" #dateクラスのデータを受け取る
require "optparse" #optparseクラスのデータを受け取る
today = Date.today #今日の情報
options = ARGV.getopts("y:", "m:") #引数付きショートネームオプションの指定

if options["y"] #もし"y"に値が入力されたら
  year = options["y"].to_i #入力値をyear変数に代入
else
  year = today.year #入力されないと今年のデータになる
end

if options["m"] #もし"m"に値が入力されたら
  mon = options["m"].to_i #入力値を今年をmonth変数に代入
else
  mon = today.mon #入力されないと今月のデータになる
end

firstday = Date.new(year,mon, 1).wday #今月初めの日
lastday = Date.new(year,mon, -1).day #今月の最終日

head = Date.new(year, mon, 1).strftime("%B, %Y") #今月の月と西暦を取得
puts head.center(20) #頭部分を中央寄せ
week = %w(Su Mo Tu We Th Fr Sa) #配列を作る表記
puts week.join(" ") #曜日の間隔を開けるように表示
print "   " * firstday #１日までの空白を表示

(1..lastday).each do |date| #(1..last...)で指定した範囲で繰り返し
  print date.to_s.rjust(2) + " " #文字列に変換して日付を右寄せで表示
  if Date.new(year,mon,date).wday == 6  #土曜(6)になったら改行する
    puts "\n"
  end
end
