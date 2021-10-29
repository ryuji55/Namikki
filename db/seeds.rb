1.times do
  User.create(
      name: 'ryuji',
      email: 'surftyping@icloud.com',
      password: '12345678',
      password_confirmation: '12345678',
      history: '8',
      reason: '海が好き'
  )
end

20.times do |index|
  Board.create(
      point: '全日本',
      wave_size: 'ハラ',
      body: '楽しかった',
      date: '2021-10-2',
      user_id: '1'
  )
end
