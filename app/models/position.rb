class Position < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '撮影' },
    { id: 2, name: '音声' },
    { id: 3, name: 'アシスタント' }
  ]
end
