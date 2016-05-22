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

  def to_db_hash
    return super.merge(
                    {
                        'text' => @text.join('\n\r') # массив строк делаем одной большой строкой
                    }
    )
  end

  def load_data(data_hash)
    super(data_hash) # дергаем родительский метод для инициализации общих полей

    # теперь прописываем свое специфичное поле
    @text = data_hash['text'].split('\n\r')
  end
end
