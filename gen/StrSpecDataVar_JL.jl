# Autogenerated from src/radiance_core/def_spectrum.F90
# svn revision 1226


    mutable struct StrSpecDataVar{P}
        parent_handle::P
    end


    # this is used to show values in the REPL and when using IJulia
    function Base.show(io::IO, m::MIME"text/plain", handle::StrSpecDataVar)
        println(io, handle)
        dump_properties(io, handle)                
    end


    function Base.propertynames(handle::StrSpecDataVar, private::Bool=false)
        names = [
            :n_sub_band,
            :n_times,
            :n_repeat_times,
            :n_rayleigh_coeff,
            :index_sub_band,
            :wavelength_sub_band,
            :time,
            :total_solar_flux,
            :solar_flux_sub_band,
            :rayleigh_coeff,
        ]

        return names
    end


    function Base.getproperty(handle::StrSpecDataVar, field::Symbol)


        cptr = getfield(getfield(handle, :parent_handle), :cptr)
        cptr != Ptr{Cvoid}() || error("invalid handle (null cptr)")            

        if field in (
            :n_sub_band,
            :n_times,
            :n_repeat_times,
            :n_rayleigh_coeff,
        )
            val = Ref{Cint}()
            field_ok = ccall(
                (:PS_StrSpecDataVar_get_integer, libSOCRATES_C),
                Cuchar,
                (Ptr{Cvoid}, Cstring, Ref{Cint}),
                cptr, String(field), val
            )
            Bool(field_ok) || error("StrSpecDataVar integer field $field not present - coding error")
            return val[]
        elseif field in (
            :index_sub_band,
            :time,
        )
            loc = Ref{Ptr{Cint}}()
            ndim = Ref{Cint}(10)
            dims = zeros(Cint, ndim[])
            lbounds = zeros(Cint, ndim[])
            field_ok = ccall(
                (:PS_StrSpecDataVar_get_integer_array, libSOCRATES_C),
                Cuchar, 
                (Ptr{Cvoid}, Cstring, Ref{Ptr{Cint}}, Ref{Cint}, Ref{Cint}, Ref{Cint}),
                cptr, String(field), loc, dims, ndim, lbounds
            )
            Bool(field_ok) || error("StrSpecDataVar Cint array field $field not present - coding error")
            if loc[] == C_NULL
                return nothing
            else
                a = unsafe_wrap(Array, loc[], Tuple(dims[1:ndim[]]), own=false)
                oa = OffsetArray(a, (lbounds[1:ndim[]] .- 1)...)
                return oa
            end
        elseif field in (
            :wavelength_sub_band,
            :total_solar_flux,
            :solar_flux_sub_band,
            :rayleigh_coeff,
        )
            loc = Ref{Ptr{Cdouble}}()
            ndim = Ref{Cint}(10)
            dims = zeros(Cint, ndim[])
            lbounds = zeros(Cint, ndim[])
            field_ok = ccall(
                (:PS_StrSpecDataVar_get_real_array, libSOCRATES_C),
                Cuchar, 
                (Ptr{Cvoid}, Cstring, Ref{Ptr{Cdouble}}, Ref{Cint}, Ref{Cint}, Ref{Cint}),
                cptr, String(field), loc, dims, ndim, lbounds
            )
            Bool(field_ok) || error("StrSpecDataVar Cdouble array field $field not present - coding error")
            if loc[] == C_NULL
                return nothing
            else
                a = unsafe_wrap(Array, loc[], Tuple(dims[1:ndim[]]), own=false)
                oa = OffsetArray(a, (lbounds[1:ndim[]] .- 1)...)
                return oa
            end
        else
            return getfield(handle, field)
        end    
           
    end


    function Base.setproperty!(handle::StrSpecDataVar, field::Symbol, val)
              

        cptr = getfield(getfield(handle, :parent_handle), :cptr)
        cptr != Ptr{Cvoid}() || error("invalid handle (null cptr)")            

        if field in (
            :n_sub_band,
            :n_times,
            :n_repeat_times,
            :n_rayleigh_coeff,
        )
                    
            field_ok = ccall(
                (:PS_StrSpecDataVar_set_integer, libSOCRATES_C),
                Cuchar,
                (Ptr{Cvoid}, Cstring, Cint),
                cptr, String(field), val
            )
            Bool(field_ok) || error("StrSpecDataVar integer field $field not present - coding error")
            return val
        else
            error("type StrSpecDataVar has no writeable field $field")    
        end    
           
    end
