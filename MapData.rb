# map_id: farm
FARM_MAP_ARRAY = [
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,2,0,0,0,2,2,2,2,2,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2,0,0,0,2,1],
[1,2,0,0,0,0,0,0,0,0,0,0,0,2,1],
[1,2,0,0,0,0,0,0,0,0,0,0,0,2,1],
[1,2,0,0,0,0,0,0,1,0,0,1,0,2,1],
[1,2,0,0,0,0,0,0,0,0,0,0,0,2,1],
[1,2,0,0,0,0,0,0,0,0,0,0,0,2,1],
[1,2,0,0,0,1,0,0,0,0,0,0,0,2,1],
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
]

# map_id: big
BIG_MAP_ARRAY = [
#0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19
[1,1,1,1,1,1,1,1,1,1, 1, 1, 1,10,11,11,12,1,1,1,1,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 7, 8, 8, 9,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 3, 4, 5, 6,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 0, 0, 0, 0,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 0, 0, 0, 0,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 0, 0, 0, 0,0,0,0,2,1],
[1,2,0,0,0,2,2,2,2,2, 0, 0, 0, 0, 0, 0, 0,0,0,0,2,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,2,0,0,0,0,0,0,0,0, 0, 0, 0, 2, 1, 1, 1,0,0,0,0,1],
[1,1,1,1,1,1,1,1,1,1, 1, 1, 1, 1, 1, 1, 1,1,1,1,1,1]
]

# map_id: home
HOME_MAP_ARRAY = [
[13,20,20,20,29,24,29,29,24,13],
[13,19,19,19,28,28,28,28,27,13],
[13,28,28,28,28,28,28,28,26,13],
[13,28,28,28,28,28,28,28,28,13],
[13,23,28,28,28,28,28,28,28,13],
[13,28,28,28,28,28,25,15,16,13],
[13,28,14,14,28,28,25,17,18,13],
[13,13,13,13,13,13,13,13,13,13]
]

WARPS = {
  home: [
    { x: 2, y: 6, warp_x: 14, warp_y: 2, map_id: :big},
    { x: 3, y: 6, warp_x: 14, warp_y: 2, map_id: :big}
    ],
  farm: [],
  big: [
    { x: 14, y: 2, warp_x: 3, warp_y: 6, map_id: :home, direction: :up}
  ]
}

# determines collision; per TILESET, not MAP
MAP_COLL = [1,3,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,23,24,26,27,29]