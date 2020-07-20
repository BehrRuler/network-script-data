Player_Join_Message:
    type: task
    debug: false
    definitions: Name|Server|uuid|Rank
    script:
        - if <server.has_flag[PlayersOnline]>:
            - if <server.flag[PlayersOnline].contains[<[UUID]>]>:
                - stop
        - flag server PlayersOnline:->:<[UUID]>

        - define color green
        - inject Embedded_Color_Formatting
        - if <[Rank].exists>:
            - define Footer "<map[].with[text].as[<[Rank]> ★ Joined on <[Server]>]>"
        - else:
            - define Footer "<map[].with[text].as[Joined <[Server]>]>"
        - define Footer <[Footer].with[icon_url].as[https://cdn.discordapp.com/attachments/642764810001448980/715739998980276224/server-icon.png]>
        - define Embeds <list[<map[].with[color].as[<[Color]>].with[footer].as[<[Footer]>]>]>

        - define Data <map[].with[username].as[<[Name]>].with[avatar_url].as[https://minotar.net/helm/<[Name]>]>
        - define Data <[Data].with[embeds].as[<[Embeds]>].to_json>

        - define Hook <script[DDTBCTY].data_key[WebHooks.651789860562272266.hook]>
        - define headers <list[User-Agent/really|Content-Type/application/json]>
        - ~webget <[Hook]> data:<[Data]> headers:<[Headers]>


Player_Quit_Message:
    type: task
    debug: false
    definitions: Name|Server|uuid|Rank
    script:
        - if !<server.has_flag[PlayersOnline]>:
            - stop
        - else if !<server.flag[PlayersOnline].contains[<[UUID]>]>:
            - stop
        - flag server PlayersOnline:<-:<[UUID]>

fuckIreallyNeedToJustMoveThisToAhAndlerbutlikeimkindafeelinlazyrn:
    type: world
    debug: false
    events:
        on server start:
            - flag server PlayersOnline:!
