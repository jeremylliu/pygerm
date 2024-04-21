import pygerm


class OutputMessage (pygerm.Component):
    message = "???"

    def onStart(self):
        print(self.message)


debug_actor = pygerm.Actor(name="debug_actor", components={"1": OutputMessage(), "2": OutputMessage()})

game_comfig = pygerm.GameConfig(game_title="testcase 0-0")
rendering_config = pygerm.RenderingConfig(x_resolution=100, y_resolution=100, clear_color =pygerm.Color(0, 0, 0))
initial_scene = pygerm.Scene(name="initial_scene", actors=[debug_actor])

game = pygerm.Game(game_config=game_comfig, rendering_config=rendering_config, initial_scene=initial_scene)
game.run()