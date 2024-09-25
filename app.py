from flask import Flask,render_template,request,redirect,url_for
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session,sessionmaker
from sqlalchemy.sql import text
import geojson


"""
code python
"""

engine = create_engine("postgresql://postgres:123@127.0.0.1:5432/bus_station")
db = scoped_session(sessionmaker(bind=engine))


app = Flask(__name__)

@app.route("/",methods = ['GET','POST'])
def home():
    
    cur_lat = request.args.get('lat')
    cur_lng = request.args.get('lng')
    if cur_lat is None or cur_lng is None:
        cur_lat = 21.02770185334812 # toa do mac dinh
        cur_lng = 105.83507392867944 
    # lấy dữ liệu từ database
    sql = "SELECT ST_AsGeoJSON(geom),name,gid from bus_station2"
    data = db.execute(text(sql)).fetchall()
    geojson_features = []
    for row in data:
        feature = {
            "type": "Feature",
            "geometry": geojson.loads(row[0]),
            "properties":{
                "name": row[1],
                "id": row[2]
            }
        }
        geojson_features.append(feature)
    
    geojson_data = {
        "type": "FeatureCollection",
        "features": geojson_features
    }
    return render_template('index.html',geojson_data = geojson_data,lat = cur_lat,lng=cur_lng)
    

# thêm 1 đối tượng vào bản đồ
@app.route('/Insert', methods = ['GET','POST'])
def insert():
    if request.method == 'POST':
        coordinates = request.form.get('latlng')
        name = request.form.get('name')
        id = int(request.form.get('id'))
        osm_id = "88888"
        code = int(5621)
        coords = coordinates.split(",")
        lat = float(coords[0].strip())
        lng = float(coords[1].strip())
        
        sql = text("INSERT INTO bus_station2(gid,osm_id,code,fclass,name,geom) VALUES(:gid,:osm_id,:code,:fclass,:name,ST_SetSRID(ST_MakePoint(:lng, :lat), 4326))")
        db.execute(sql,{"gid":id,"osm_id":osm_id,"code": code,"fclass":'bus_stop',"name":name,"lng":lng,"lat":lat})
        db.commit()
        result = "THÀNH CÔNG"
        return render_template('insert.html',result = result)
    return render_template('insert.html')

# xóa đối tượng khỏi bản đồ
@app.route('/delete',methods = ['GET','POST'])
def delete():
    if request.method == 'POST':
        del_id = request.form.get('del_id')
        coords = request.form.get('latlng').split(",")
        cur_lat = float(coords[1].strip())
        cur_lng = float(coords[0].strip())
        sql = "DELETE FROM bus_station2 WHERE gid = '{}'".format(del_id)
        db.execute(text(sql))
        db.commit()
        return redirect(url_for('home',lat=cur_lat,lng = cur_lng))

# Láy thông tin cho việc update
@app.route('/get_infor',methods = ['GET','POST'])
def get_infor():
    if request.method == 'POST':
        name = request.form.get('name')
        cur_id = request.form.get('id')
        latlng = request.form.get('lat_lng')
    return render_template('update.html',name=name,cur_id=cur_id,latlng=latlng)

# update thông tin 1 đối tượng
@app.route('/update',methods = ['GET','POST'])
def update():
    result = ""
    if request.method == 'POST':
        curId = request.form.get('cur_id')
        newId = request.form.get('new_id')
        newName = request.form.get('new_name')
        newLatLng = request.form.get('latlng').split(",")
        newLat = float(newLatLng[0].strip())
        newLng = float(newLatLng[1].strip())
        sql = text("UPDATE bus_station2 SET gid = :newId,name = :newName,geom = ST_SetSRID(ST_MakePoint(:lng, :lat), 4326) WHERE gid = :curId")
        db.execute(sql,{"newId":newId,"newName":newName,"lng":newLng,"lat":newLat,"curId":curId})
        db.commit()
        result = "THÀNH CÔNG"
    return render_template('update.html',result = result)
app.run(debug=1)