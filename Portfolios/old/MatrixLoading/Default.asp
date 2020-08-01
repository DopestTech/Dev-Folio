<!DOCTYPE html><html lang='en' class=''>
<head><title>Home</title><meta charset='UTF-8'>
<link rel='stylesheet prefetch' href='reset.min.css'>
<style class="cp-pen-styles">@import url(https://fonts.googleapis.com/css?family=Source+Code+Pro:400);
html,
body {
  height: 100%;
}

body {
  background: radial-gradient(#222922, #000500);
  font-family: 'Source Code Pro', monospace;
  font-weight: 400;
  overflow: hidden;
  padding: 30px 0 0 30px;
  text-align: center;
  color: #6f6;
}

.word {
  bottom: 0;
  color: #fff;
  font-size: 2.5em;
  height: 2.5em;
  left: 0;
  line-height: 2.5em;
  margin: auto;
  right: 0;
  position: absolute;
  text-shadow: 0 0 10px rgba(50, 255, 50, 0.5), 0 0 5px rgba(100, 255, 100, 0.5);
  top: 0
}

.word span {
  display: inline-block;
  -webkit-transform: translateX(100%) scale(0.9);
          transform: translateX(100%) scale(0.9);
  transition: -webkit-transform 500ms;
  transition: transform 500ms;
  transition: transform 500ms, -webkit-transform 500ms;
}

.word .done {
  color: #6f6;
  -webkit-transform: translateX(0) scale(1);
          transform: translateX(0) scale(1);
}

.overlay {
  background-image: linear-gradient(transparent 0%, rgba(10, 16, 10, 0.5) 50%);
  background-size: 1000px 2px;
  bottom: 0;
  content: '';
  left: 0;
  position: absolute;
  right: 0;
  top: 0;
}

/*  Cursor */
.blinking-cursor {
  font-weight: 100;
  font-size: 18px;
  color: #6f6;
  -webkit-animation: 1s blink step-end infinite;
  -moz-animation: 1s blink step-end infinite;
  -ms-animation: 1s blink step-end infinite;
  -o-animation: 1s blink step-end infinite;
  animation: 1s blink step-end infinite;
}

@keyframes "blink" {
  from, to {
    color: transparent;
  }
  50% {
    color: #6f6;
  }
}

@-moz-keyframes blink {
  from, to {
    color: transparent;
  }
  50% {
    color: #6f6;
  }
}

@-webkit-keyframes "blink" {
  from, to {
    color: transparent;
  }
  50% {
    color: #6f6;
  }
}

@-ms-keyframes "blink" {
  from, to {
    color: transparent;
  }
  50% {
    color: #6f6;
  }
}

@-o-keyframes "blink" {
  from, to {
    color: transparent;
  }
  50% {
    color: #6f6;
  }
}

.header-cursor{
  position:absolute;
  bottom:10px;
  left:10px;
}

#header-text{
  font-size:12px;
  line-spacing:18px;
}
</style></head><body>
<div class="header-cursor"><span class="blinking-cursor">|</span><span id="header-text"></span></div>
<div class="word">LOADING...</div>
<div class="overlay"></div>
<script src='jquery.min.js'></script><script src='jquery.lettering.min.js'></script>
<script >function Ticker( elem ) {
	elem.lettering();
	this.done = false;
	this.cycleCount = 5;
	this.cycleCurrent = 0;
	this.chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()-_=+{}|[]\\;\':"<>?,./`~'.split('');
	this.charsCount = this.chars.length;
	this.letters = elem.find( 'span' );
	this.letterCount = this.letters.length;
	this.letterCurrent = 0;

	this.letters.each( function() {
		var $this = $( this );
		$this.attr( 'data-orig', $this.text() );
		$this.text( '-' );
	});
}

Ticker.prototype.getChar = function() {
	return this.chars[ Math.floor( Math.random() * this.charsCount ) ];
};

Ticker.prototype.reset = function() {
	this.done = false;
	this.cycleCurrent = 0;
	this.letterCurrent = 0;
	this.letters.each( function() {
		var $this = $( this );
		$this.text( $this.attr( 'data-orig' ) );
		$this.removeClass( 'done' );
	});
	this.loop();
};

Ticker.prototype.loop = function() {
	var self = this;

	this.letters.each( function( index, elem ) {
		var $elem = $( elem );
		if( index >= self.letterCurrent ) {
			if( $elem.text() !== ' ' ) {
				$elem.text( self.getChar() );
				$elem.css( 'opacity', Math.random() );
			}
		}
	});

	if( this.cycleCurrent < this.cycleCount ) {
		this.cycleCurrent++;
	} else if( this.letterCurrent < this.letterCount ) {
		var currLetter = this.letters.eq( this.letterCurrent );
		this.cycleCurrent = 0;
		currLetter.text( currLetter.attr( 'data-orig' ) ).css( 'opacity', 1 ).addClass( 'done' );
		this.letterCurrent++;
	} else {
		this.done = true;
	}

	if( !this.done ) {
		requestAnimationFrame( function() {
			self.loop();
		});
	} else {
		setTimeout( function() {
			self.reset();
		}, 750 );
	}
};

$words = $( '.word' );
$words.each( function() {
	var $this = $( this ),
		ticker = new Ticker( $this ).reset();
	$this.data( 'ticker', ticker  );
});

function MatrixTyper(e,t,stop,s){
	$words = $(e);
	$words.html(t.replace(/ /g , "&nbsp;"));
	$words.each( function() {
		var $this = $( this ),
		ticker = new Ticker( $this ).reset();
		$this.data( 'ticker', ticker  );
	});	
	if (stop){
		setTimeout( function() {
			$words.html(t);
		}, s);
	}	
}

var headerC = $("#header-text");
MatrixTyper(headerC, "(<%Response.Write(Request.ServerVariables("remote_addr"))%>) <%Response.Write(Now)%> - " + navigator.userAgent,false,0);


setTimeout( function() {
			var loading = $(".word");
			MatrixTyper(loading, "Wake up, Neo...",true,2300);
						
			setTimeout( function() {
				var loading = $(".word");
				MatrixTyper(loading, "The Matrix has you...",true,2700);
			}, 15000);
			
		}, 360000);
</script>
</body></html>