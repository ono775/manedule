class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '問題なし' },
    { id: 2, name: '修理予定' },
    { id: 3, name: '修理中' },
    { id: 4, name: '廃棄予定' },
    { id: 5, name: '廃棄済み' }
  ]
end
