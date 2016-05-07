class Memo < Post

  def read_from_console
    puts "Новая заметка (всё, что пишите до строчки \"end\"):"

    @text = []
    line = nil

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end

    # удаляем строчку "end"
    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    # добавляем в начало массива строчку времени создания
    return @text.unshift(time_string)
  end
end
