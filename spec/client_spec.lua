require'busted'
package.path = package.path..'../src'

local client = require'websocket.client'

describe(
   'The client module',
   function()     
      local wsc
      it(
	 'exposes the correct interface',
	 function()
	    assert.is_same(type(client),'table')
	    assert.is_same(type(client.new),'function')
	 end)

      it(
	 'can be constructed',
	 function()
	    wsc = client.new
	    {
	       url = 'ws://localhost:8080',
	       protocol = 'echo-protocol'
	    }
	 end)

      it(
	 'can send',
	 function()
	    assert.is_same(type(wsc.send),'function')	    
	    wsc:send('Hello again')
	 end)

      it(
	 'can receive',
	 function()
	    assert.is_same(type(wsc.receive),'function')	    
	    local echoed = wsc:receive()
	    assert.is_same(echoed,'Hello again')
	 end)

   end)