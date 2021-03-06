%VariablesGrid
%
%  Licence:
%    This file is part of ACADO Toolkit  - (http://www.acadotoolkit.org/)
%
%    ACADO Toolkit -- A Toolkit for Automatic Control and Dynamic Optimization.
%    Copyright (C) 2008-2009 by Boris Houska and Hans Joachim Ferreau, K.U.Leuven.
%    Developed within the Optimization in Engineering Center (OPTEC) under
%    supervision of Moritz Diehl. All rights reserved.
%
%    ACADO Toolkit is free software; you can redistribute it and/or
%    modify it under the terms of the GNU Lesser General Public
%    License as published by the Free Software Foundation; either
%    version 3 of the License, or (at your option) any later version.
%
%    ACADO Toolkit is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%    Lesser General Public License for more details.
%
%    You should have received a copy of the GNU Lesser General Public
%    License along with ACADO Toolkit; if not, write to the Free Software
%    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
%
%    Author: Rien Quirynen
%    Date: 2012
%
classdef VariablesGrid < handle
    properties(SetAccess='private')
        name;
        mat;
    end
    
    methods
        function obj = VariablesGrid(matrix)
            global ACADO_;
            
            if( isa(matrix, 'acado.Matrix') )
                obj.mat = matrix;
                obj.name = strcat(matrix.name, '_grid');
                
                ACADO_.helper.addInstruction(obj);
            else
                error('VariablesGrid expects a Matrix object.'); 
            end
        end
        
        
        function s = toString(obj)
            s = obj.name;
        end
        
        
        function getInstructions(obj, cppobj, get)
            if (get == 'FB')
                fprintf(cppobj.fileMEX,sprintf('    VariablesGrid %s(%s);\n', obj.name, obj.mat.name));
            end
        end
        
    end
    
end

