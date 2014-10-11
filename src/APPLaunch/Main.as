package APPLaunch
{	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Main extends Sprite
	{
		[Embed(source="asset/未命名-1.png")]
		protected const chufangClass:Class;
		[Embed(source="asset/未命名-1.xml",mimeType="application/octet-stream")]
		protected const chufangXML:Class;
		private var tm:Timer;
		private var image:Image;
		private var moonTexture:Texture
		private var atlas:TextureAtlas;
		private var textureVector:Vector.<Texture>;
		public function Main()
		{
			var texture:Texture = Texture.fromBitmap(new chufangClass());
			//var image:Image =new Image(texture);
			var xml:XML = XML(new chufangXML());
			atlas = new TextureAtlas(texture,xml);
			moonTexture = atlas.getTexture("元件_10001");
			textureVector = atlas.getTextures("元件_");
			image =  new Image(moonTexture);
			image.width = 256;
			image.height = 256;
			image.x = 30;
			image.y = 50;
			this.addEventListener(TouchEvent.TOUCH,onTouch);
			addChild(image);
			//tween
		var tween:Tween = new Tween(image,1);
			tween.animate("y",20);
			tween.animate("scaleX",1);
			tween.animate("scaleY",1);
			tween.animate("alpha",0);
			Starling.juggler.add(tween);
			
			//影片剪辑
			/*var movie:MovieClip = new MovieClip(textureVector,18);
			movie.loop = true;
			addChild(movie);
			Starling.juggler.add(movie);
			movie.play();
			*/
			this.addEventListener(EnterFrameEvent.ENTER_FRAME,onFrame);
		}
		private function onTouch(e:TouchEvent):void{
			var touch:Touch = e.getTouch(this,TouchPhase.BEGAN);
			if(touch){
				var localPos:Point = touch.getLocation(this);
				image.x =localPos.x;
				image.y = localPos.y;
				trace("Touched object at position: "+localPos);
			}
		}
		private function onFrame(e:EnterFrameEvent):void{
			image.x++;
			if(image.x ==400)image.x=0;
		}
		private function onTime(e:TimerEvent):void{
			switch(tm.currentCount%4){
			case 0:
				moonTexture = atlas.getTexture("元件_10001");image =  new Image(moonTexture);break;
			case 1:
				moonTexture = atlas.getTexture("元件_10002");image =  new Image(moonTexture);break;
			case 2:
				moonTexture = atlas.getTexture("元件_10003");image =  new Image(moonTexture);break;
			case 3:
				moonTexture = atlas.getTexture("元件_10001");image =  new Image(moonTexture);break;
			default:
				moonTexture = atlas.getTexture("元件_10001");image =  new Image(moonTexture);break;
			}
		}
	}
}