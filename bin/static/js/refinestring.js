	    function refineContent(input) {
			if(input == "")
				return "";
			var content = input;
			content = content.replace(/</g, "&lt;");
			content = content.replace(/>/g, "&gt;");
			content = content.replace(/"/g, "&quot;");
			content = content.replace(/'/g, "&#39;");
			content = content.replace(/\n/g, "<br>");
			return content;
	    }
		function refineContentView(input) {
			if(input == "")
				return "";
			var content = input;
			return content;
		}
		function refineContentRev(input) {
			if(input == "")
				return "";
			var content = input;
			content = content.replace(/&lt;/g, "<");
			content = content.replace(/&gt;/g, ">");
			content = content.replace(/&quot;/g, '"');
			content = content.replace(/&#39;/g, "'");
			content = content.replace(/<br>/g, "\n");
			return content;
		}
		function removeBR(input){
			if(input == "")
				return "";
			var content = input;
			content = content.replace(/<br>/g, "&nbsp;");
			content = content.replace(/<\/br>/g, "&nbsp;");
			content = content.replace(/<br\/>/g, "&nbsp;");
			content = content.replace(/<br \/>/g, "&nbsp;");
			return content;
		}