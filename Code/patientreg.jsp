<%@ include file="header.jsp"%>
<%
if(request.getParameter("msg")!=null){

out.println("<script>alert('Same User Id already available')</script>");
}


%>
 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">Patient</h1>
            
          </div>
        </div>
      </div>
    </section>
	<br><br><br><br>
	<div class="row block-9 justify-content-center mb-5">
          <div class="col-md-10 mb-md-5">
          	<h2 class="text-center">Patient Registration </h2>
            <form action="patientreg2.jsp" id="demoForm" method="post" class="demoForm" >
              <div class="form-group">
                <input type="text" class="form-control" pattern="[A-Za-z]+" name="name" placeholder="Patient Name" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="uid" placeholder="User ID" required>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" name="pwd" placeholder="Password" required>
              </div>
              <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email" required>
              </div>
              <div class="form-group">
                <input type="text" class="form-control"  name="mno" pattern="[0-9]{10,10}" placeholder="Mobile NO." required>
              </div>

				<div class="form-group">
				<select  name="gender"  class="form-control" required>
				<option value=""> Select Gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				
                </select>
              </div>
              
			   <div class="form-group">
                <input type="number" class="form-control" name="age" placeholder="Patient Age" required>
              </div>
              
			 

			  <div class="form-group">
                <input type="submit" value="Register" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
      </div>


	  <script type="text/javascript">
/*
From JavaScript and Forms Tutorial at dyn-web.com
Find information and updates at http://www.dyn-web.com/tutorials/forms/
*/

// removes all option elements in select list 
// removeGrp (optional) boolean to remove optgroups
function removeAllOptions(sel, removeGrp) {
    var len, groups, par;
    if (removeGrp) {
        groups = sel.getElementsByTagName('optgroup');
        len = groups.length;
        for (var i=len; i; i--) {
            sel.removeChild( groups[i-1] );
        }
    }
    
    len = sel.options.length;
    for (var i=len; i; i--) {
        par = sel.options[i-1].parentNode;
        par.removeChild( sel.options[i-1] );
    }
}

function appendDataToSelect(sel, obj) {
    var f = document.createDocumentFragment();
    var labels = [], group, opts;
    
    function addOptions(obj) {
        var f = document.createDocumentFragment();
        var o;
        
        for (var i=0, len=obj.text.length; i<len; i++) {
            o = document.createElement('option');
            o.appendChild( document.createTextNode( obj.text[i] ) );
            
            if ( obj.value ) {
                o.value = obj.value[i];
            }
            
            f.appendChild(o);
        }
        return f;
    }
    
    if ( obj.text ) {
        opts = addOptions(obj);
        f.appendChild(opts);
    } else {
        for ( var prop in obj ) {
            if ( obj.hasOwnProperty(prop) ) {
                labels.push(prop);
            }
        }
        
        for (var i=0, len=labels.length; i<len; i++) {
            group = document.createElement('optgroup');
            group.label = labels[i];
            f.appendChild(group);
            opts = addOptions(obj[ labels[i] ] );
            group.appendChild(opts);
        }
    }
    sel.appendChild(f);
}

// anonymous function assigned to onchange event of controlling select list
document.forms['demoForm'].elements['category'].onchange = function(e) {
    // name of associated select list
    var relName = 'choices[]';
    
    // reference to associated select list 
    var relList = this.form.elements[ relName ];
    
    // get data from object literal based on selection in controlling select list (this.value)
    var obj = Select_List_Data[ relName ][ this.value ];
    
    // remove current option elements
    removeAllOptions(relList, true);
    
    // call function to add optgroup/option elements
    // pass reference to associated select list and data for new options
    appendDataToSelect(relList, obj);
};

// object literal holds data for optgroup/option elements
var Select_List_Data = {
    
    // name of associated select list
    'choices[]': {
        
        // names match option values in controlling select list
       Engineering: {
            // optgroup labe
                text: ['Designing','Programming','Testing'],
                value: ['Designing','Programming','Testing']
            },
   
       Accounting: {
            // example without optgroups
            text: ['Payroll','Investment'],
            value: ['Payroll', 'Investment']
        },
			Marketing: {
            // example without optgroups
            text: ['Financial','H.R'],
            value: ['Financial','H.R']
        },
		
		
        mrktaaaaa: {
            'Download Demos': {
                // example without values
                text: ['Iframes', 'PHP to JS', 'Unobtrusive JS']
            },
            
            'No Download': {
                text: ['Object Literals', 'Initializing JS', 'JS Errors']
            }
        }
    }
    
};

// populate associated select list when page loads
window.onload = function() {
    var form = document.forms['demoForm'];
    
    // reference to controlling select list
    var sel = form.elements['category'];
    sel.selectedIndex = 0;
    
    // name of associated select list
    var relName = 'choices[]';
    // reference to associated select list
    var rel = form.elements[ relName ];
    
    // get data for associated select list passing its name
    // and value of selected in controlling select list
    var data = Select_List_Data[ relName ][ sel.value ];
    
    // add options to associated select list
    appendDataToSelect(rel, data);
};

</script>


<%@ include file="footer.jsp"%>