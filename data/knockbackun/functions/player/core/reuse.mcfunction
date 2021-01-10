#> knockbackun:player/core/reuse
#
# ライブラリ再使用に必要なタグの消去、その他エラー表示等を実行します。
#
# @api

# 失敗テキスト
    # テキストの整列
        execute if entity @e[tag=CANNOT_KnockBack] run tellraw @a [{"text":"エラーが発生しました。","color":"red","bold":false}]
    # 実行エンティティが存在しない
        execute if entity @e[type=!item,tag=CANNOT_KnockBack] unless entity @e[tag=CAN_KnockBack] run tellraw @a [{"text":"ノックバックを発生させるエンティティが存在しません。","color":"red","bold":true}]
    # ストレージの引数が存在しない
        execute if entity @e[tag=CANNOT_KnockBack] unless data storage knockbackun_: {Preset:KnockBack} unless data storage knockbackun_: {Preset:Approach} unless data storage knockbackun_: {Preset:Distance} run tellraw @a [{"text":"Preset","color":"gray"},{"text":"引数が間違っている可能性があります。","color":"red","bold":true}]
        execute if entity @e[tag=CANNOT_KnockBack] unless data storage knockbackun_: {Facing:Normal} unless data storage knockbackun_: {Facing:Rotate} unless data storage knockbackun_: {Facing:Attacker} unless data storage knockbackun_: {Facing:Neutral} run tellraw @a [{"text":"Facing","color":"gray"},{"text":"引数が間違っている可能性があります。","color":"red","bold":true}]
        execute if entity @e[tag=CANNOT_KnockBack] unless data storage knockbackun_: {KBR:true} unless data storage knockbackun_: {KBR:false} run tellraw @a [{"text":"KBR","color":"gray"},{"text":"引数が間違っている可能性があります。","color":"red","bold":true}]

# タグ消去
    tag @e[tag=CANNOT_KnockBack] remove CANNOT_KnockBack
    tag @e[tag=CAN_KnockBack] remove CAN_KnockBack