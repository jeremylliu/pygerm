import pygerm


class OutputMessage (pygerm.Component):
    message = "???"
    image = "./resources/images/circle.png"
    image2 = "./resources/images/box1.png"
    pressed = False

    def onUpdate(self):
        if pygerm.Input.getKey("right"):
            pygerm.Camera.setPosition(pygerm.Camera.getPositionX() + 0.02,pygerm.Camera.getPositionY())

        if pygerm.Input.getKey("left"):
            pygerm.Camera.setPosition(pygerm.Camera.getPositionX() - 0.02,pygerm.Camera.getPositionY())

        if pygerm.Input.getKey("up"):
            pygerm.Camera.setPosition(pygerm.Camera.getPositionX(),pygerm.Camera.getPositionY() - 0.02)

        if pygerm.Input.getKey("down"):
            pygerm.Camera.setPosition(pygerm.Camera.getPositionX(),pygerm.Camera.getPositionY() + 0.02)

        if pygerm.Input.getKey("space") and not self.pressed:
            self.pressed = True
            pygerm.Scene.persist(self.actor)
            pygerm.Scene.load(scene2) # this is beyond bugged at the moment

        pygerm.Image.draw(image_path=self.image, x=0, y=1)
        pygerm.Image.drawUI(image_path=self.image2, x=25, y=25)

class DummyComponent (pygerm.Component):
    def onUpdate(self):
        print("I JUST SPAM")

actor1 = pygerm.Actor(name="actor1", components={"0": OutputMessage()})
scene1 = pygerm.Scene(name="initial_scene", actors=[actor1])

actor2 = pygerm.Actor(name="actor2", components={"0": DummyComponent()})
scene2 = pygerm.Scene(name="scene2", actors=[actor2])

config = pygerm.GameConfig("./resources/game.config")
rendering = pygerm.RenderingConfig(r=55, x_resolution=500, y_resolution=300)


game = pygerm.Game()
game.initial_scene = scene1
game.game_config = config
game.rendering_config = rendering
game.run()